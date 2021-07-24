help:		 #Print this line
	fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep |sed -e 's/##//'

Frontend:	## Install Frontend Component
	@bash frontend.sh

Catalogue:	## Install Catalogue Component
	@bash catalogue.sh

Cart:		## Install Cart Component
	@bash cart.sh

User:		## Install User Component
	@bash user.sh

Shipping:	## Install Shipping Component
	@bash shipping.sh

Payment:	## Install Payment Component
	@bash payment.sh

MongodB:	## Install Mongodb Component
	@bash mongodb.sh

Redis:		## Install Redis Component
	@bash redis.sh

MySQL:		## Install MySQL Component
	@bash mysql.sh

Rabbitmq:	## Install Rabbitmq Component
	@bash rabbitmq.sh

databases:	## Install all Databases
databases:	mongodb redis mysql rabbitmq