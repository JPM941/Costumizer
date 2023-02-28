class PagesController < ApplicationController
  def home
  end

  def dashboard

    # ma liste de costume dont je suis proprio
    @mycostumes = Costume.where(user: current_user)

    # créer une nouvelle variable @pending_requests et @confirmed_requests
    @pending_requests = []
    @confirmed_requests = []

    # itérer sur mes costumes
    @mycostumes.each do |mycostume|
      # vérifier les bookings de chaque costume
      mycostume.bookings.each do |booking|
        # vérifier le statut de ces bookings
        if booking.status == "pending"
          # pusher les bookings correspondants dans ces variables
          @pending_requests << booking
        elsif booking.status == "confirmed"
          @confirmed_requests << booking
        end
      end
    end

    # mes demandes de reservation auprès d'autres loueurs
    @mybookings = Booking.where(user: current_user)
    # @bookingrequests
  end

end
