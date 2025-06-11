# 🏠 Student Housing Recommendation API

This is a Python Flask-based rule-based recommendation system for student housing.  
It helps match students with appropriate housing options based on preferences like faculty, budget, gender, room size, amenities, and type.

---

## 📦 Required Libraries

Install the required Python packages:

bash
pip install flask flask-cors pandas


Also install *ngrok* to expose your local server to the internet:

- Download from: https://ngrok.com/download  
- Or install via npm (if Node.js is installed):

bash
npm install -g ngrok


---

## 🚀 How to Run

1. *Clone the repository:*

bash
git clone https://github.com/your-username/your-repo-name.git
cd your-repo-name


2. *Make sure the dataset file is present:*

The file should be named:


DataSet Rule_Based_System.csv


And placed in the root of the project directory.

3. *Run the Flask server:*

bash
python app.py


The server will run at:


http://localhost:5000


---

## 🌐 Make It Public with ngrok

In a new terminal, run:

bash
ngrok http 5000


You will get a public URL like:


https://abcd1234.ngrok.io


Use this as your backend URL in tools like FlutterFlow.

---

## 📬 API Endpoint

### POST /api/recommend

*Content-Type:* application/json

### Request Example:

json
{
  "faculty": "Computer Science",
  "budget": 1500,
  "gender": "male",
  "required_amenities": ["wifi"],
  "preferred_size": { "rooms": 1, "beds": 1 },
  "preferred_type": "shared_room"
}


### Response Example:

json
{
  "recommendations": [2, 5, 9]
}


---

## 🧠 Logic Summary

The system filters housing options by:

- Gender
- Faculty cluster match
- Budget (±20%)
- Amenities
- Size (rooms/beds)
- Type

If no exact match is found, constraints are gradually relaxed to find the closest available options.
