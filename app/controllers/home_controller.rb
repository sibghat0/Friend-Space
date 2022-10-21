class HomeController < ApplicationController
def home
    @documents = Document.all
    @documents = Document.all.order("created_at DESC")
end
def about
    
end

def profile
    
end

    
end
