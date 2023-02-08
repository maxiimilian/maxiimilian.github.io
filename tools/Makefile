STATIC_DIR := "../static"

$(STATIC_DIR)/img/vcard_qr.png $(STATIC_DIR)/pierzyna_maximilian.vcf: generate_qrcode.py
	python generate_qrcode.py
	mv vcard_qr.png $(STATIC_DIR)/img
	mv pierzyna_maximilian.vcf $(STATIC_DIR)