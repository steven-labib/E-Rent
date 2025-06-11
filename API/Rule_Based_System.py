import pandas as pd

# دالة تحميل البيانات من CSV
def load_housing_data(csv_path):
    df = pd.read_csv(csv_path)
    housing_options = []
    for _, row in df.iterrows():
        amenities = row.get("Amenities", "").split(",") if pd.notna(row.get("Amenities", "")) else []
        size = {"rooms": int(row["Rooms"]), "beds": int(row["Beds"])}
        housing_options.append({
            "id": int(row["ID"]),
            "faculty_cluster": row["Faculty Cluster"],
            "price": int(row["Price"]),
            "amenities": [a.strip() for a in amenities],
            "size": size,
            "type": row["Type"],
            "gender": row["Gender"]
        })
    return housing_options

# تحميل البيانات من الملف
housing_options = load_housing_data('DataSet Rule_Based_System.csv')

# Expanded faculty clusters
faculty_clusters = {
    "Medical": ["Medicine", "Pharmacy", "Dentistry", "Nursing", "Physical Therapy", "Biomedical Sciences"],
    "Engineering": ["Computer Engineering", "Mechanical Engineering", "Electrical Engineering", "Civil Engineering", "Architecture", "Chemical Engineering"],
    "Business": ["Business Administration", "Economics", "Marketing", "Accounting", "Finance"],
    "Sciences": ["Physics", "Chemistry", "Biology", "Mathematics", "Biotechnology"],
    "Arts": ["Literature", "Fine Arts", "History", "Philosophy", "Psychology"],
    "IT": ["Computer Science", "Information Technology", "Artificial Intelligence", "Data Science", "Software Engineering"],
    "Law": ["Law", "Legal Studies", "International Law"]
}

def get_faculty_cluster(faculty):
    for cluster, faculties in faculty_clusters.items():
        if faculty.lower() in [f.lower() for f in faculties]:
            return cluster
    return None

def recommend_housing(faculty, budget, required_amenities, preferred_size, preferred_type, gender):
    recommendations = []
    faculty_cluster = get_faculty_cluster(faculty) if faculty else None
    rejection_reasons = []

    # Stage 1: Exact match
    for housing in housing_options:
        reasons = []

        if housing["gender"] != gender:
            reasons.append(f"Gender mismatch (required: {gender}, found: {housing['gender']})")
            rejection_reasons.append({"id": housing["id"], "reasons": reasons})
            continue

        if faculty_cluster and housing["faculty_cluster"] != faculty_cluster:
            reasons.append(f"Faculty cluster mismatch (required: {faculty_cluster}, found: {housing['faculty_cluster']})")

        price_margin = budget * 0.2
        if not (budget - price_margin <= housing["price"] <= budget + price_margin):
            reasons.append(f"Price out of range (required: {budget - price_margin}-{budget + price_margin}, found: {housing['price']})")

        amenities_match = all(amenity.lower() in [a.lower() for a in housing["amenities"]] for amenity in required_amenities)
        if not amenities_match:
            reasons.append(f"Amenities missing (required: {required_amenities}, found: {housing['amenities']})")

        size_match = (housing["size"]["rooms"] >= preferred_size["rooms"] and
                     housing["size"]["beds"] >= preferred_size["beds"])
        if not size_match:
            reasons.append(f"Size mismatch (required: {preferred_size}, found: {housing['size']})")

        if preferred_type and housing["type"] != preferred_type:
            reasons.append(f"Type mismatch (required: {preferred_type}, found: {housing['type']})")

        if not reasons:
            recommendations.append(housing["id"])
        else:
            rejection_reasons.append({"id": housing["id"], "reasons": reasons})

    # Stage 2: Relax faculty and type
    if not recommendations:
        fallback_recommendations = []
        for housing in housing_options:
            reasons = []
            if housing["gender"] != gender:
                continue
            if not (budget - price_margin <= housing["price"] <= budget + price_margin):
                continue
            if not all(amenity.lower() in [a.lower() for a in housing["amenities"]] for amenity in required_amenities):
                continue
            if not (housing["size"]["rooms"] >= preferred_size["rooms"] and
                    housing["size"]["beds"] >= preferred_size["beds"]):
                continue
            fallback_recommendations.append({"id": housing["id"], "faculty_cluster": housing["faculty_cluster"], "type": housing["type"]})

        if fallback_recommendations:
            recommendations = [r["id"] for r in fallback_recommendations[:5]]
            print("No exact matches found. Returning closest matches (relaxed faculty or type constraints):")
        else:
            # Stage 3: Relax amenities and size
            final_fallback = []
            for housing in housing_options:
                if housing["gender"] != gender:
                    continue
                if not (budget - price_margin <= housing["price"] <= budget + price_margin):
                    continue
                final_fallback.append({"id": housing["id"], "amenities": housing["amenities"], "size": housing["size"]})

            if final_fallback:
                recommendations = [r["id"] for r in final_fallback[:5]]
                print("No matches with required amenities or size. Returning closest matches (matching gender and price only):")
            else:
                print("No matches found, even with relaxed constraints. Reasons for rejection:")
                for rejection in rejection_reasons:
                    print(f"Housing ID {rejection['id']}: {', '.join(rejection['reasons'])}")

    return recommendations

# Test cases
student1 = {
    "faculty": "Computer Science",
    "budget": 1500,
    "required_amenities": ["wifi"],
    "preferred_size": {"rooms": 1, "beds": 1},
    "preferred_type": "",
    "gender": "male"
}

print("Test Case 1 (Your input):")
recommended_housing1 = recommend_housing(**student1)
print("Recommended housing IDs:", recommended_housing1)

student2 = {
    "faculty": "Medicine",
    "budget": 2000,
    "required_amenities": ["wifi", "study_desk"],
    "preferred_size": {"rooms": 1, "beds": 1},
    "preferred_type": "shared_room",
    "gender": "female"
}

print("\nTest Case 2 (Different input):")
recommended_housing2 = recommend_housing(**student2)
print("Recommended housing IDs:", recommended_housing2)

student3 = {
    "faculty": "Fine Arts",
    "budget": 1000,
    "required_amenities": ["wifi"],
    "preferred_size": {"rooms": 1, "beds": 1},
    "preferred_type": "dorm",
    "gender": "female"
}

print("\nTest Case 3 (Low budget, female, Arts):")
recommended_housing3 = recommend_housing(**student3)
print("Recommended housing IDs:", recommended_housing3)

# student4 = {
#     "faculty": "Invalid Faculty",
#     "budget": 4000,
#     "required_amenities": ["wifi", "ac"],
#     "preferred_size": {"rooms": 2, "beds": 2},
#     "preferred_type": "apartment",
#     "gender": "male"
# }

# print("\nTest Case 4 (Invalid faculty, high budget):")
# recommended_housing4 = recommend_housing(**student4)
# print("Recommended housing IDs:", recommended_housing4)




























