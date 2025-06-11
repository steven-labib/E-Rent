from flask import Flask, request, jsonify
from http import HTTPStatus
from Rule_Based_System import recommend_housing

app = Flask(__name__)

@app.route('/api/recommend', methods=['POST'])
def recommend():
    data = request.get_json()

    faculty = data.get('faculty')
    budget = data.get('budget')
    gender = data.get('gender')
    required_amenities = data.get('required_amenities', [])
    preferred_size = data.get('preferred_size', {"rooms": 1, "beds": 1})
    preferred_type = data.get('preferred_type', "")

    # التحقق من الحقول الأساسية
    if not all([budget, gender]):
        return jsonify({"error": "Missing required fields: budget or gender"}), HTTPStatus.BAD_REQUEST

    recommendations = recommend_housing(
        faculty=faculty,
        budget=budget,
        required_amenities=required_amenities,
        preferred_size=preferred_size,
        preferred_type=preferred_type,
        gender=gender
    )

    return jsonify({"recommendations": recommendations}), HTTPStatus.OK

if __name__ == '_main_':
    app.run(host='0.0.0.0', port=5000,debug=True)

































