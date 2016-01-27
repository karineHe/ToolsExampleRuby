class GeneratePdf < Prawn::Document

  def initialize(fact)
    super()
    @facture = fact
    #@refs = refs
    #@obj = obj

    header
    text_content
    footer

  end

  def header
    @facture.emetteur
  end

  def objet
    @facture.objet
  end

  def text_content
    y_position = cursor - 50

    bounding_box([300, y_position], :width => 270, :height => 300) do
      text "Duis Vel", size: 15, style: :bold
      text "Duis vel tortor elementum, ultrices trotor vel"
    end
  end

  def footer
    image "#{Rails.root}/app/assets/images/user2.png", width: 530, height: 150
  end

end
