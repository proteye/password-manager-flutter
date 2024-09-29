prepare: get gen l10n

get:
	@echo "*️⃣ Get packages ..."
	@flutter clean && flutter pub get

upgrade:
	@echo "*️⃣ Upgrade packages ..."
	@flutter clean && flutter pub upgrade

gen:
	@echo "*️⃣ Codegen started ..."
	@dart run build_runner build --delete-conflicting-outputs

l10n:
	@echo "*️⃣ Generate l10n localization started ..."
	@flutter gen-l10n
