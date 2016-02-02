class GeneratePdf < Prawn::Document

  require 'prawn/table'

  def initialize(fact)
    super()
    @facture = fact

    header
    objet
    text_content

  end

  def header
    move_down 30
    pos_start_cursor = cursor
    bounding_box([20, cursor], width: 180, height:160) do
      stroke do
        rectangle [-20, cursor + 10], 200, 200
        move_down 10
        text "TOOLSEXAMPLE", size: 15, style: :bold
        text "www.testexample.com"
        move_down 10
        text "Votre contact :", style: :bold
        text @facture.emetteur
        text "302 Rue de Vaugirard"
        text "75015 Paris"
        text "Tél: 0145363728"
        text "Fax: 0145363730"
        text "contact@testExample.com"
      end
    end
    bounding_box([300, pos_start_cursor - 10], width: 250, height:50) do
      text "Facture n°#{@facture.id}", size: 15, style: :bold
      text "Date : #{@facture.updated_at.strftime("%d %b %Y")}", size: 15, style: :bold
    end
    bounding_box([300, pos_start_cursor - 90], width: 200, height:100) do
      text @facture.set_dest, size: 15
      text @facture.get_client_addr, size: 15
    end

  end

  def objet
    move_down 20
    stroke_horizontal_rule
    pad(10) { text "Objet : #{@facture.objet}", size: 14, style: :bold}
    stroke_horizontal_rule
  end

  def text_content
    move_down 20
    #bounding_box([10, cursor], width: 530) do
      data = [[" <b><font size='12'>Référence</font></b>", "<b><font size='12'>Description</font></b>","<b><font size='12'>PU HT</font></b>",  "<b><font size='12'>Qté</font></b>", "<b><font size='12'>TVA</font></b>", "<b><font size='12'>Prix TTC</font></b>"]]
      @facture.ref_array.each do |ref|
        data << [ref[0].name, ref[0].desc, ref[0].pu_ht, ref[1], ref[0].tva, ref[0].pu_ht]
      end
      table(data, header: true, width: 520, row_colors: ["F0F0F0", "FFFFFF"], cell_style: {inline_format: true})
    #end
    move_down 20
      stroke do
        text "RECAPITULATIF", size: 15, style: :bold
        stroke_horizontal_rule
        move_down 10
        text "Nombre de références : #{@facture.assignments.count}"
        text "Total HT : #{@facture.assignments.count}"
        text "Total TVA : #{@facture.assignments.count}"
        text "Total TTC : #{@facture.assignments.count}"
        move_down 15
        text "A régler avant le : #{(@facture.updated_at + 30.days).strftime("%d %b %Y")}"
        text "Net à payer: ", size: 13, style: :bold

      end
  end

end
