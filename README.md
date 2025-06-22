# 🍽️ Food Menu Booking System

A full-stack Ruby on Rails application that allows organizations to manage daily food menus, and lets employees submit their food preferences (snacks, dinner, chapatis) for each day.

---

## 🚀 Features

- Admins can:
  - Create, edit, and delete daily menus.
  - View all responses (today’s and previous).
  - Export daily responses to Excel.
  - Receive role-based access to manage menus and users.
  
- Employees can:
  - Submit their daily food preferences (within a 2-hour time window).
  - View their submitted preferences and update them within the allowed time.
  
- Email Notifications:
  - All employees get notified via email when a new menu is created.
  - Includes a direct login link using magic link authentication.

---

## 🔐 Security & Access

- 🧑‍💼 **Admin will be seeded** using Rails seeds.
- 🏢 **Default organization** is set up automatically.
- 👥 **Default user role** is `employee`.
- 🔑 **Authentication** handled via Devise.
- ✨ **Passwordless magic link login** supported via email.
- 🔐 **Role-based authorization** ensures employees and admins access only relevant features.
- 🛠️ **Centralized admin dashboard** controls menu creation, deletion, user responses, and exports.

---

## 🛠️ Tech Stack

- **Backend:** Ruby on Rails 7+
- **Database:** PostgreSQL
- **Authentication:** Devise + Magic Link (Passwordless)
- **Mailer:** ActionMailer with SMTP
- **Export:** Axlsx for Excel downloads
- **Frontend:** Bootstrap 5 for UI components

---

## 📦 Setup Instructions

1. Clone the repo:
   ```bash
   git clone https://github.com/your-username/food-menu-booking.git
   cd food-menu-booking

---

### 2. Install dependencies

```bash
bundle install
yarn install # if using webpacker or js bundling
```

### 3. Database setup

```bash
rails db:create db:migrate db:seed
```

### 4. Run the server

```bash
rails server
```

### 5. Open in browser

Visit: [http://localhost:3000](http://localhost:3000)

---

## 🔐 Environment Setup

### Email Configuration (SMTP)
Ensure you have configured SMTP settings in `config/environments/development.rb` for mail sending (Devise & menu notifications):

```ruby
config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
config.action_mailer.delivery_method = :smtp
config.action_mailer.smtp_settings = {
  address: 'smtp.gmail.com',
  port: 587,
  user_name: 'your_email@gmail.com',
  password: 'your_app_password',
  authentication: 'plain',
  enable_starttls_auto: true
}
```

---

## ✨ Demo Admin Credentials

```text
Email: admin@example.com
Password: password
```

---

## 📁 Folder Structure Highlights

- `app/models` – User, Menu, Response models
- `app/controllers/admin/` – Admin menu & response management
- `app/controllers/employee/` – Employee dashboard and submission
- `app/mailers/menu_mailer.rb` – Email notifications
- `app/views/` – Organized view folders per user role
- `config/routes.rb` – Namespaced routes for admin/employee

---

## 🧪 Testing & Development

Use Rails console to create additional data:

```bash
rails console

# Example: Create employee
User.create!(email: "emp@example.com", password: "password", role: "employee", user_name: "Shantanu", organization_id: 1)
```

---

## 📤 Excel Export

Admins can export today's responses with totals:

- Snacks (Yes/No)
- Dinner (Yes/No)
- Total Chapatis

Output is an `.xlsx` file.

---

## 🧩 To-Do / Improvements

- Allow bulk user import via CSV/Excel
- Admin analytics dashboard (charts)
- Employee feedback/comments
- Response reminder emails

---

## 🙌 Contributing

Feel free to fork and enhance the system. Pull requests are welcome!

---

## 👨‍💻 Developed by

**Shantanu Khokrale**  
_Passionate Ruby on Rails Developer_
