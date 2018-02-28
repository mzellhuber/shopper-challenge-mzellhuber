json.extract! applicant, :id, :first_name, :last_name, :region, :phone, :email, :phone_type, :source, :over_21, :reason, :workflow_state, :created_at, :updated_at
json.url applicant_url(applicant, format: :json)
