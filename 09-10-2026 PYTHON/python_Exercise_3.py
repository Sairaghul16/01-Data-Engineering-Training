
import json

projects = [
    {
        "project_id": 101,
        "project_name": "Data Migration",
        "department": "IT",
        "budget": 450000,
        "technologies": ["Python", "SQL", "Azure"],
        "team": [
            {
                "name": "Vikram",
                "role": "Engineer",
                "experience": 4
            },
            {
                "name": "Meera",
                "role": "Analyst",
                "experience": 3
            }
        ]
    },
    {
        "project_id": 102,
        "project_name": "Customer Analytics",
        "department": "Analytics",
        "budget": 300000,
        "technologies": ["Python", "Pandas", "Power BI"],
        "team": [
            {
                "name": "Karan",
                "role": "Data Analyst",
                "experience": 5
            },
            {
                "name": "Zoya",
                "role": "Developer",
                "experience": 2
            }
        ]
    },
    {
        "project_id": 103,
        "project_name": "Cloud Modernization",
        "department": "Cloud",
        "budget": 600000,
        "technologies": ["Azure", "Docker", "Python"],
        "team": [
            {
                "name": "Naveen",
                "role": "Cloud Engineer",
                "experience": 6
            },
            {
                "name": "Isha",
                "role": "Engineer",
                "experience": 4
            }
        ]
    }
]

# Create the JSON file
with open("projects.json", "w") as file:
    json.dump(projects, file, indent=4)

print("projects.json file created successfully!")


## 1. Read the JSON file into Python

import json


with open("projects.json", "r") as file:
    projects = json.load(file)

#2. Check the datatype of the returned object.
print("Datatype:", type(projects))

#3. Display all project names.
print("\nProject names:")
for project in projects:
    print(project["project_name"])

#4. Display projects having a budget above ₹4,00,000 .
print("\nProjects with budget above 400000:")
for project in projects:
    if project["budget"] > 400000:
        print(project["project_name"], project["budget"])


#5. Display projects that use Python .
print("\nProjects using Python:")
for project in projects:
    if "Python" in project["technologies"]:
        print(project["project_name"])



# 6. Calculate total budget
total_budget = sum(map(lambda x: x["budget"], projects))
print("\nTotal budget:", total_budget)

# 7. Extract all technologies into one list
technologies = []
for project in projects:
    technologies.extend(project["technologies"])

print("\nAll technologies:", technologies)

# 8. Find unique technologies
unique_technologies = set(technologies)
print("\nUnique technologies:", unique_technologies)

# 9. Display every team member's name, role and experience
print("\nTeam members:")
for project in projects:
    for member in project["team"]:
        print(
            member["name"],
            member["role"],
            member["experience"]
        )

# 10. Team members with more than 3 years of experience
print("\nExperience greater than 3 years:")
for project in projects:
    for member in project["team"]:
        if member["experience"] > 3:
            print(member["name"], member["experience"])

# 11. Total number of team members
total_members = sum(
    map(lambda project: len(project["team"]), projects)
)
print("\nTotal team members:", total_members)


# 12. Sort projects by budget from highest to lowest
print("\nProjects sorted by budget:")
sorted_budget = sorted(
    projects,
    key=lambda x: x["budget"],
    reverse=True
)
for project in sorted_budget:
    print(project["project_name"], project["budget"])

# 13. Sort projects alphabetically by project name
print("\nProjects sorted by name:")
sorted_names = sorted(
    projects,
    key=lambda x: x["project_name"]
)
for project in sorted_names:
    print(project["project_name"])


# 14. Sort each project's team members by experience
print("\nTeam members sorted by experience:")
for project in projects:
    sorted_team = sorted(
        project["team"],
        key=lambda x: x["experience"]
    )
    print(project["project_name"])
    for member in sorted_team:
        print(member["name"], member["experience"])


