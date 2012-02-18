class MailerObserverObserver < ActiveRecord::Observer
 observe :submission, :talk
  def after_create(model)
    # ovdje3 napisi kod za slanje mailova
  end
end
