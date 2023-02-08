"""
Following: https://segno.readthedocs.io/en/stable/contact-information.html
"""
import datetime
import segno
import segno.helpers

URL = "https://maximilian-pierzyna.de"
VCF_NANME = "pierzyna_maximilian.vcf"

vcard: str = segno.helpers.make_vcard_data(
    name="Pierzyna;Maximilian",
    displayname="Maximilian Pierzyna",
    email="m.pierzyna@tudelft.nl",
    title="PhD researcher, Optical turbulence and machine learning",
    url=URL,
    #city="Delft",
    #country="Netherlands",
    org="TU Delft",
    rev=datetime.date.today(),
    source=f"{URL}/{VCF_NANME}"
)
with open(VCF_NANME, "wb") as f:
    f.write(vcard.encode("UTF-8"))

qrcode = segno.make(vcard, error="H")
print(qrcode.designator, qrcode.mode)
qrcode.save("vcard_qr.png", scale=4)