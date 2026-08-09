import random
import json
from datetime import datetime

def generate_random_user():
    first_names = ["Alice", "Bob", "Charlie", "Diana", "Eve", "Frank", "Grace", "Henry"]
    last_names = ["Smith", "Johnson", "Williams", "Brown", "Jones", "Garcia", "Miller", "Davis"]
    domains = ["gmail.com", "yahoo.com", "outlook.com", "example.com"]
    
    first = random.choice(first_names)
    last = random.choice(last_names)
    email = f"{first.lower()}.{last.lower()}@{random.choice(domains)}"
    age = random.randint(18, 80)
    
    return {
        "name": f"{first} {last}",
        "email": email,
        "age": age,
        "created_at": datetime.now().isoformat()
    }

def generate_users(count):
    users = []
    for _ in range(count):
        users.append(generate_random_user())
    return users

def save_to_json(users, filename):
    with open(filename, 'w') as f:
        json.dump(users, f, indent=2)
    print(f"Saved {len(users)} users to {filename}")

def display_users(users):
    print("\n" + "="*60)
    print(f"Generated {len(users)} Users")
    print("="*60)
    for i, user in enumerate(users, 1):
        print(f"{i}. {user['name']} | {user['email']} | Age: {user['age']}")
    print("="*60 + "\n")

def main():
    print("User Generator Script")
    print("-" * 30)
    
    try:
        num_users = int(input("Enter number of users to generate (1-100): "))
        if not 1 <= num_users <= 100:
            print("Please enter a number between 1 and 100")
            return
        
        users = generate_users(num_users)
        display_users(users)
        
        save_option = input("Save to JSON file? (yes/no): ").lower()
        if save_option in ['yes', 'y']:
            save_to_json(users, "users.json")
    
    except ValueError:
        print("Invalid input. Please enter a valid number.")

if __name__ == "__main__":
    main()
