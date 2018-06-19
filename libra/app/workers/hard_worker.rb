class HardWorker
  include Sidekiq::Worker


# Need to Run Below Command to Boot Sidekiq with Mailer

# bundle exec sidekiq -q default -q mailers

  def perform(email)
    UserMailer.welcome_email(email.to_s).deliver
  end
end



# Also use ----------http://localhost:3000/sidekiq ---------- For Viewing Sidekiq Dashboard