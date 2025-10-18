import qrcode
from PIL import Image, ImageDraw, ImageFont

# Link do Google Drive - Download direto
# Formato: https://drive.google.com/uc?export=download&id=FILE_ID
link = "https://drive.google.com/uc?export=download&id=1Tvtv8PsZ6ukX6Xy397yb7_xkamwKig7n"

# Criar QR Code
qr = qrcode.QRCode(
    version=1,
    error_correction=qrcode.constants.ERROR_CORRECT_H,
    box_size=10,
    border=4,
)
qr.add_data(link)
qr.make(fit=True)

# Gerar imagem do QR Code
qr_img = qr.make_image(fill_color="#2C3E50", back_color="white").convert('RGB')

# Criar uma imagem maior com texto
width, height = qr_img.size
new_height = height + 150
final_img = Image.new('RGB', (width, new_height), 'white')

# Colar o QR Code
final_img.paste(qr_img, (0, 0))

# Adicionar texto
draw = ImageDraw.Draw(final_img)
try:
    font_title = ImageFont.truetype("arial.ttf", 32)
    font_subtitle = ImageFont.truetype("arial.ttf", 20)
except:
    font_title = ImageFont.load_default()
    font_subtitle = ImageFont.load_default()

# Texto
title = "Ombro Amigo"
subtitle = "Escaneie para baixar o app"

# Centralizar texto
title_bbox = draw.textbbox((0, 0), title, font=font_title)
title_width = title_bbox[2] - title_bbox[0]
title_x = (width - title_width) // 2

subtitle_bbox = draw.textbbox((0, 0), subtitle, font=font_subtitle)
subtitle_width = subtitle_bbox[2] - subtitle_bbox[0]
subtitle_x = (width - subtitle_width) // 2

# Desenhar texto
draw.text((title_x, height + 20), title, fill="#2C3E50", font=font_title)
draw.text((subtitle_x, height + 70), subtitle, fill="#5A6C7D", font=font_subtitle)

# Salvar imagem
final_img.save("qrcode_ombro_amigo.png")
print("QR Code gerado com sucesso: qrcode_ombro_amigo.png")
