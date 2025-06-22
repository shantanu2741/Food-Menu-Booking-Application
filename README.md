# 🍽️ Food Menu Booking System

A full-featured Ruby on Rails web application designed for organizations to efficiently manage daily food preferences of employees. Admins can create menus, employees can submit responses, and data can be exported for reporting.

---

## 🚀 Features

### ✅ Employee
- Login via email/password or passwordless magic link
- View and submit today's food preferences:
  - Snacks (Yes/No)
  - Dinner (Yes/No)
  - Chapati Count
- Edit submitted response (only within 2 hours of menu creation)

### ✅ Admin
- Admin dashboard with today's menu and recent menus
- Create, update, or delete daily menus
- View all employee responses (filtered by date)
- Export daily responses as Excel (.xlsx) sheet
- Menu creation triggers email notification to all employees

### ✅ System
- Secure authentication (Devise)
- Passwordless login with magic link
- Bootstrap-enhanced responsive UI
- Role-based access (admin vs employee)

---

## 🛠️ Technologies Used

- **Ruby on Rails** 8+
- **PostgreSQL** (preferred)
- **Devise** (authentication)
- **Passwordless** (magic link login)
- **caxlsx / caxlsx_rails** (Excel export)
- **Bootstrap** 5
- **Stimulus** (for alerts/UX)
- **ActionMailer** (menu notification emails)

---

## 📦 Installation

### 1. Clone the repository

```bash
git clone https://github.com/your-username/food-menu-booking.git
cd food-menu-booking
```

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
