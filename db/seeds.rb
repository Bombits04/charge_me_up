# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Create a default admin user
admin_user = User.create!(email: "admin@admin.com",
                          username: "admin",
                          password: "password",
                          is_admin: true,
                          confirmed_at: Time.now)

# Create a chg_spot
chg_spot = ChgSpot.create!(name: "Ricardo's Vista Del Cielo",
                           region: "Calabarzon",
                           province: "Rizal",
                           city: "Tanay",
                           barangay: "Sampaloc",
                           address: "H9G9+HXR, Marikina-Infanta Hwy",
                           lat: "14.576507422613469",
                           lng: "121.36989561733498",
                           user_id: admin_user.id,
                           is_approved: true,
                           description: "This beautiful and quaint spot lies along the Eastern part of the Sierra Madre Mountain ranges. Beautiful sunrises, cool winds, magnificent rainbow, and sea of clouds are its glorious gifts. Pure Nature at its best!",
                           notes: "Good elecrical system, can accomodate up to 10 units charging at around 10 amps each. (electrical outlets rated at 50 amps each)",
                           created_by: admin_user.username)

# Create a comment for the chg_spot above
Comment.create!(chg_spot: chg_spot,
                user: admin_user,
                comment: "This is a great spot!",
                is_cmt_approved: true)

# Create a chg_spot
chg_spot = ChgSpot.create!(name: "Screamery Lakeshore",
                           region: "Calabarzon",
                           province: "Rizal",
                           city: "Binangonan",
                           barangay: "",
                           address: "G538+JWX, Binangonan, Rizal",
                           lat: "14.504210037174241",
                           lng: "121.16733888328152",
                           user_id: admin_user.id,
                           is_approved: false,
                           description: "Screamery Lakeshore has a very open area where personal electric vehicles can be parked and charged. They offer a variety of food and drinks to choose from. The place is also very near the lake, so you can enjoy the view while charging your vehicle.",
                           notes: "They offer electrical outlets and heavy-duty extension cords however, most electrical outlets are only rated at 10 amps each",
                           created_by: admin_user.username)

chg_spot = ChgSpot.create!(name: "JCL Kambingan at Bulalohan Grills",
                           region: "Calabarzon",
                           province: "Rizal",
                           city: "Antipolo",
                           barangay: "Bautista",
                           address: "J6GM+46H, Marilaque Road, Sitio Calumpang Brgy, Bautista, Antipolo",
                           lat: "14.625476267310143",
                           lng: "121.23314365921215",
                           user_id: admin_user.id,
                           is_approved: false,
                           description: "Budget friendly and 'just ok' food. ",
                           notes: "They charge 20 php for each unit that would be charging and the electical outlets are quite weak when more than 3 units are charging however, they are very accomodating to PEV owners.",
                           created_by: admin_user.username)
