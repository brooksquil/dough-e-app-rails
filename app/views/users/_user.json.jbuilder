json.extract! user, :id, :first_name, :last_name, :email, :password_digest, :work_phone, :mobile_phone, :is_active, :is_admin, :company_id, :created_at, :updated_at
json.url user_url(user, format: :json)
