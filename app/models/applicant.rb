class Applicant < ActiveRecord::Base

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :phone, presence: true, uniqueness: true
  validates :phone_type, presence: true
  validates :workflow_state, presence: true
  validates :region, presence: true

  validates_uniqueness_of :email, case_sensitive: false
  validates_uniqueness_of :phone

  before_validation :init_workflow, on: :create

  #from sqlite3 database

  #select distinct(workflow_state) from applicants
  WORKFLOW_STATE = ["quiz_started", "applied", "quiz_completed", "onboarding_requested", "onboarding_completed", "hired"]
  #select distinct(phone_type) from applicants
  PHONE_TYPE = ["Windows Phone", "Android 2.2/2.3 (over 2 years old)", "iPhone 5/5S", "iPhone 3G/3GS", "iPhone 6/6 Plus", "iPhone 4/4S", "Android 4.0+ (less than 2 years old)", "iPhone 6s/6s Plus", "Blackberry", "Other"]
  #select distinct(region) from applicants
  REGION = ["Chicago", "Boston", "Delhi", "San Francisco Bay Area", "Berlin", "NYC", "Toronto"]

  private

    def init_workflow
      self.workflow_state = WORKFLOW_STATE.first unless workflow_state
    end
end
