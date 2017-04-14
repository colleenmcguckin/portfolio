# ./portfolio.rb

class Portfolio < Roda
  plugin :static, ["/images", "/css", "/js"]
  plugin :render
  plugin :head
  plugin :assets, css: 'style.css'
  plugin :static, ['/images'], root: 'assets'
  plugin :render, engine: 'haml'
  plugin :public, root: 'public/images'
  plugin :mailer
  plugin :params_capturing

  route do |r|
    r.public
    r.assets

    r.root do
      @active = 'about'
      view("about")
    end
    r.get 'contact' do
      @active = 'contact'
      view("contact")
    end
    r.get 'work' do
      @active = 'work'
      view("work")
    end
    r.on ['send_mail', :name, :email, :message] do
      puts r[:name]
      puts r[:email]
      puts r[:message]

      r.mail 'contact_inquiry' do
        @name = r[:name]
        @email = r[:email]
        @message = r[:message]
        from 'colleenmcguckin@gmail.com'
        to 'colleenmcguckin@gmail.com'
        subject "New Contact Inquiry from #{@name}"
        render :contact_inquiry_email
      end
      r.redirect "/contact"
    end
  end
end
