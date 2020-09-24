class GeneratorController < ApplicationController

    def new 
    end

    # Dev : uncomment this method to preview generate document with data in dev
    # def attestation_inscription
    #     @form = {
    #         civility: "M.", 
    #         firstname: "Developper",
    #         lastname: "Astronaute", 
    #         email: "astrodev@univers.io", 
    #         address: "42 galaxie de l'univers", 
    #         zipcode: "42 Draconis", 
    #         city: "univers", 
    #         phone_number: "@Ù€€Ùôµ≠ô€@ô≠≠", 
    #         situation: "1", 
    #         motivations: "La motivation est un concept abstrait sur notre planete", 
    #         consent_cpf: true        
    #     }
    # end

    def submit
        @form = permitted_params
        generate_document
        create_tmp_file
        #upload_on_drive unless Rails.env.development? # comment to try this feature in dev 
        send_file @file.path, 
            filename: "#{@filename}.pdf", 
            disposition: :attachement
    end

    def generate_document 
        pdf_as_string = ActionController::Base.new.render_to_string(
            template: 'generator/attestation_inscription.html.erb', 
            layout: 'pdf.html', 
            locals: { :@form => @form, :@ip => @ip}
        )
        @pdf = WickedPdf.new.pdf_from_string(pdf_as_string)
    end

    def create_tmp_file
        @filename = "#{@form['firstname']}_#{@form['lastname']}_attestation_cpf"
        tmp_path = "/tmp/#{@filename}.pdf"
        @file = File.open(tmp_path, 'wb') do |file|
          file << @pdf
        end
    end

    def upload_on_drive
        session = GoogleDrive::Session.from_config("config.json")
        session.upload_from_file("/tmp/#{@filename}.pdf", "#{@filename}.pdf", convert: false) 
    end

    private

    def permitted_params
        params.permit(
            :civility, 
            :firstname,
            :lastname, 
            :email, 
            :address, 
            :zipcode, 
            :city, 
            :phone_number, 
            :situation, 
            :motivations, 
            :consent_cpf,
            :authenticity_token, 
            :commit
        )
    end
end
