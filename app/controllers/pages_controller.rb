class PagesController < ApplicationController
  def home
  end

  def dashboard
    # mes demandes de reservation auprès d'autres loueurs
    @mybookings = Booking.where(user: current_user)
    # ma liste de costume dont je suis proprio
    @mycostumes = Costume.where(user: current_user)


    # @bookingrequests

    # créer une nouvelle variable @pending_bookings et @confirmed_bookings
    @pending_bookings = []
    @confirmed_bookings = []

    # itérer sur mes costumes
    @mycostumes.each do |mycostume|
    # vérifier les bookings de chaque costume
      mycostume.bookings.each do |booking|
        # vérifier le statut de ces bookings
        if booking.status == "pending"
          # pusher les bookings correspondants dans ces variables
          @pending_bookings << booking
        elsif booking.status == "confirmed"
          @confirmed_bookings << booking
        end
      end
    end
  end

  def profile
  end

end
