# 🏠 Apartment Brokerage System

מערכת לניהול והצגת נכסי נדל"ן (תיווך), הכוללת ממשק משתמש מתקדם באנגולר, שרת API ב-.NET ומסד נתונים SQL Server.

## ✨ תכונות עיקריות
* **גלריית נכסים מעוצבת:** הצגת דירות בכרטיסיות (Cards) עם עיצוב נקי ומודרני.
* **חיפוש דינמי:** אפשרות לחיפוש דירות לפי עיר או תיאור בזמן אמת.
* **ניהול סטטוסים:** הצגת סטטוס הנכס (פנוי, במשא ומתן, תפוס) בצורה ויזואלית.
* **פרטי סוכן:** הצגת פרטי הקשר של הסוכן האחראי לכל נכס.
* **CRUD מלא:** תשתית להוספה, עדכון ושליפת נכסים ממסד הנתונים.

## 🛠 טכנולוגיות
* **Frontend:** Angular (v17+), TypeScript, SCSS.
* **Backend:** ASP.NET Core Web API.
* **Database:** SQL Server (T-SQL, Stored Procedures).
* **Styling:** Google Fonts (Assistant), Flexbox & Grid.

## 🗄 מבנה מסד הנתונים
הפרויקט מבוסס על שלוש טבלאות עיקריות:
1. `Agents` - ניהול סוכני הנדל"ן.
2. `ApartmentStatuses` - ניהול מצב הנכס.
3. `Apartments` - ריכוז כל הנתונים על הדירות עם קשרי גומלין (Foreign Keys) לסוכנים ולסטטוסים.



## 🚀 איך להריץ את הפרויקט?

### 1. מסד נתונים (SQL)
יש להריץ את הסקריפט הנמצא בתיקיית `sql/schema.sql` (או הקוד שסידרנו) בתוך SQL Server Management Studio.

### 2. השרת (Backend)
```bash
cd api/ApartmentBrokerage.Api
dotnet run
### 3. הלקוח (Frontend)
cd client/Apartment-app
npm install
ng serve
