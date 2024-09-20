.PHONY: deploy build clean landstewards_clean static_clean

#################################################
# flutter_deploy_web - build & deploy flutter web app
#################################################
deploy:
	$(MAKE) clean
	$(MAKE) build
	cp -r landstewards_app/build/web static/
	flyctl deploy
	

build:
	cd landstewards_app && flutter build web --release 

#################################################
# clean - clean all build targets
#################################################
clean:
	$(MAKE) landstewards_clean
	$(MAKE) static_clean

landstewards_clean:
	cd landstewards_app && flutter clean
	rm -rf landstewards_app/build/web/

static_clean:
	rm -rf static/*