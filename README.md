# 🏠 Apartment Brokerage System

מערכת **Fullstack מקצועית לניהול והצגת נכסי נדל״ן**.
המערכת מאפשרת צפייה בדירות, חיפוש מתקדם וניהול נתונים דרך API ו־Database רלציוני.

הפרויקט בנוי בארכיטקטורה מודרנית הכוללת **Frontend באנגולר, Backend ב-.NET Web API ומסד נתונים SQL Server**.

---

# ✨ Features

### 🏢 Apartment Gallery

תצוגה ויזואלית של נכסי נדל״ן באמצעות **כרטיסיות מעוצבות (Cards)** המציגות פרטי דירה בצורה ברורה ונוחה.

### 🔎 Smart Search

אפשרות לחיפוש דירות בזמן אמת לפי:

* עיר
* כתובת
* תיאור הנכס

### 👨‍💼 Agent Management

לכל דירה משויך **סוכן נדל״ן אחראי** המנהל את הטיפול בנכס.

### 📊 Apartment Status Tracking

מערכת סטטוסים לנכסים:

* Available – פנוי
* In Negotiation – במו״מ
* Occupied – תפוס

### 🗄 Reliable Data Infrastructure

המערכת משתמשת ב־**Stored Procedures** לניהול שליפת והזנת נתונים בצורה יעילה ומסודרת.

---

# 🛠 Tech Stack

## Frontend

* Angular 17+
* TypeScript
* SCSS
* Flexbox & Grid
* Google Fonts (Assistant)

## Backend

* .NET Web API
* C#

## Database

* SQL Server
* T-SQL
* Stored Procedures

---

# 🗄 Database Structure

המערכת מבוססת על **מסד נתונים רלציוני** הכולל שלוש טבלאות מרכזיות:

### Agents

מכילה את פרטי סוכני הנדל״ן.

### ApartmentStatuses

טבלת סטטוסים עבור נכסים.

### Apartments

טבלת הדירות הכוללת:

* פרטי נכס
* קישור לסוכן (AgentId)
* קישור לסטטוס (StatusId)

הקשרים בין הטבלאות מנוהלים באמצעות **Foreign Keys**.

---

# ⚠️ Technical Issue Solved

במהלך הפיתוח התרחשה שגיאת SQL:

Msg 515 – Cannot insert the value NULL into column 'AgentId'

### Cause

ניסיון להכניס דירה כאשר לא קיים סוכן משויך.

### Solution

הוטמע מנגנון עבודה מסודר:

1. הזנת סוכנים לטבלת **Agents**
2. שימוש ב-AgentId קיים בעת יצירת דירה

כך נמנעת חריגה במסד הנתונים ונשמרת שלמות הנתונים.

---

# 🚀 Running the Project

## 1️⃣ Backend

יש להפעיל את ה-API מתוך תיקיית השרת:

```bash
cd api/ApartmentBrokerage.Api
dotnet run
```

השרת יעלה בדרך כלל בכתובת:

```
http://localhost:5000
```

---

## 2️⃣ Frontend

יש לפתוח טרמינל נוסף ולהריץ:

```bash
cd client/Apartment-app
npm install
ng serve
```

האפליקציה תהיה זמינה בכתובת:

```
http://localhost:4200
```

---

# 📌 Project Architecture

```
project-root
│
├── api
│   └── ApartmentBrokerage.Api
│
├── client
│   └── Apartment-app
│
└── database
    └── SQL scripts
```

---

# 📷 UI Concept

הממשק מציג את הדירות באמצעות **כרטיסיות מודרניות** עם פרטים מרכזיים כגון:

* כתובת
* עיר
* מחיר
* סטטוס
* סוכן אחראי

העיצוב מבוסס **Grid ו-Flexbox** לקבלת תצוגה רספונסיבית ונוחה למשתמש.

---

# 📌 Future Improvements

אפשרויות הרחבה עתידיות:

* מערכת התחברות לסוכנים
* הוספת תמונות לנכסים
* פילטרים מתקדמים לחיפוש
* מערכת ניהול נכסים מלאה (CRUD)
* פריסה לענן

---

# 👩‍💻 Author

Developed as a **Fullstack practice project**
Angular • .NET • SQL Server
