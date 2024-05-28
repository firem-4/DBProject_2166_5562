const OpenAI = require('openai');
const puppeteer = require("puppeteer-extra");
const StealthPlugin = require("puppeteer-extra-plugin-stealth");

require('dotenv').config();
const fs = require('fs');

// Load API keys from .env file
let apiKeys = [];
apiKeys.push(process.env['USER_1_API_KEY']);
// Generate accounts from API keys
let accounts = [];
for (let i = 0; i < apiKeys.length; i++) {
    accounts.push({"api_key": apiKeys[i], "output": [], browser: null, page: null, chat: null});
}

const main_model = "gpt-3.5-turbo-1106";

const openai = new OpenAI();
puppeteer.use(StealthPlugin());
const timeout = 1500;


async function openBrowser() {
    return await puppeteer.launch({
        headless: false,
        executablePath: '/Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary',
        userDataDir: '/Users/meir/Library/Application\ Support/Google/Chrome\ Canary/Default',
    });
}

async function getBrowser(account) {
    // If there is no active browser session for the account, start a new one
    if (account.browser === null) {
        account.browser = await openBrowser();
    }
    return account.browser;
}

async function openPage(browser) {
    const page = await browser.newPage();
    await page.setViewport({
        width: 1200,
        height: 1200,
        deviceScaleFactor: 1,
    });
    return page;
}

async function getPage(account) {
    const browser = await getBrowser(account);
    // If there is no active page for the account, open a new one
    if (account.page === null) {
        account.page = await openPage(browser);
    }
    return account.page;
}




async function openERDPlus(account, postfix) {
    const page = await getPage(account);
    await page.goto("https://erdplus.com/" + postfix);
    await page.waitForTimeout(timeout);
    return page;
}

// click based on XPath
async function clickXPath(page, xpath) {
    const [element] = await page.$x(xpath);
    if (!element) {
        throw new Error("Element not found");
    }
    await element.click();
}

//login
async function loginERDPlus(account, page, username, password) {
    console.log("Logging in to ERDPlus");
    //the id is email
    await page.waitForSelector("#email");
    await page.type("#email", username);
    await page.waitForSelector("#password");
    await page.type("#password", password);
    //button to click
    let loginButtonXPATH = "//*[@id=\"root\"]/section/div[2]/div[4]/button";

    // await page.waitForSelector(loginbutton);
    await clickXPath(page, loginButtonXPATH);
    await page.waitForTimeout(timeout);
    return page;
}







//main function
async function main(request, username, password) {
    let needLogin = false;
    let account = accounts[0];

    let postfix = "documents";

    if (needLogin) {
        postfix = "login";
    }

    let page = await openERDPlus(account, postfix);
    if (needLogin) {
        page = await loginERDPlus(account, page, username, password);
        console.log("Logged in to ERDPlus");
        await page.waitForTimeout(timeout);
    }
    //click on our project
    let ourProjectButtonXPATH = "/html/body/div[1]/section/div[2]/div[4]/div[1]/div/ul/li/div[1]";
    await clickXPath(page, ourProjectButtonXPATH);
    await page.waitForTimeout(timeout);


    askAI(account, page, request);
    // //add entity
    // let name = "Entity1";
    // let myAttributes = [["attribute1", false], ["attribute2", true], ["attribute3", false]];
    // await addEntity(account, page, name, myAttributes);


}

let prefix = "add these entities to the ERD only in english! : ";
let question = "1. 1. *טבלת מתנדבים*\n" +
    "   - Volunteer_ID: מזהה ייחודי למתנדב.\n" +
    "   - First_Name: שם פרטי.\n" +
    "   - Last_Name: שם משפחה.\n" +
    "   - Address: כתובת.\n" +
    "   - Phone_Number: מספר טלפון.\n" +
    "   - Email: דוא\"ל.\n" +
    "   - Role_ID: מזהה תפקיד (אם למתנדב יש תפקיד קבוע).\n" +
    "   - Join_Date: תאריך הצטרפות.\n" +
    "   - Status: מצב המתנדב (פעיל/לא פעיל).\n" +
    "\n" +
    "2. *טבלת תפקידים*\n" +
    "   - Role_ID: מזהה ייחודי לתפקיד.\n" +
    "   - Role_Name: שם התפקיד.\n" +
    "   - Description: תיאור התפקיד.\n" +
    "   - Required_Training: הכשרה נדרשת.\n" +
    "   - Max_Volunteers: מספר מתנדבים מקסימלי לתפקיד.\n" +
    "\n" +
    "3. *טבלת משמרות*\n" +
    "   - Shift_ID: מזהה ייחודי למשמרת.\n" +
    "   - Date: תאריך המשמרת.\n" +
    "   - Start_Time: זמן התחלת המשמרת.\n" +
    "   - End_Time: זמן סיום המשמרת.\n" +
    "   - Location: מיקום המשמרת.\n" +
    "   - Shift_Leader: מזהה המתנדב שמוביל את המשמרת.\n" +
    "\n" +
    "4. *טבלת פעילויות*\n" +
    "   - Activity_ID: מזהה ייחודי לפעילות.\n" +
    "   - Activity_Name: שם הפעילות.\n" +
    "   - Activity_Description: תיאור הפעילות.\n" +
    "   - Activity_Date: תאריך הפעילות.\n" +
    "   - Activity_Start_Time: זמן התחלת הפעילות.\n" +
    "   - Activity_End_Time: זמן סיום הפעילות.\n" +
    "   - Shift_ID: מזהה המשמרת שאליה קשורה הפעילות.\n" +
    "\n" +
    "5. *טבלת אירועים*\n" +
    "   - Event_ID: מזהה ייחודי לאירוע.\n" +
    "   - Event_Date: תאריך האירוע.\n" +
    "   - Event_Time: זמן האירוע.\n" +
    "   - Location: מיקום האירוע.\n" +
    "   - Description: תיאור האירוע.\n" +
    "   - Shift_ID: מזהה המשמרת שאליה שייך האירוע.\n" +
    "\n" +
    "6. *טבלת דוחות*\n" +
    "   - Report_ID: מזהה ייחודי לדוח.\n" +
    "   - Creation_Date: תאריך יצירת הדוח.\n" +
    "   - Report_Type: סוג הדוח (לדוגמה, דוח פעילות, דוח אירוע, דוח פציעה, וכו').\n" +
    "   - Content: תוכן הדוח.\n" +
    "   - Volunteer_ID: מזהה המתנדב שיצר את הדוח.\n" +
    "   - Event_ID: מזהה האירוע שאליו הדוח שייך."

let username;
let password;
question="coffee shop inventory system";
// username = "technobladeshorts@gmail.com";
// password = "AR-iPgkz5vJmKx8";
username = "myemail@gmail.com";
password = "mypassword";

main(prefix + question, username, password);