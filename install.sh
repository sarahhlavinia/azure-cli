#!/bin/bash

# functions

function upgrade() {
	cat << EOM

	You already have a version of the CloudSQL cli installed.

	Upgrading your version of CloudSQL CLI to the latest stable version.

	EOM
}

function install() {
cat << EOM

You don't have a version of the CloudSQL cli installed.

Installing the latest stable version.

EOM
}


# variables

file="/usr/local/bin/cloudsql-cli"

aliaschk=$(alias | grep cloudsql-cli=)

function copyfiles() {

	    curl -LJO https://github.atcloud.io/raw/AutoTrader/cloudsql-cli/master/cloudsql-cli
	        chmod +x /usr/local/bin/cloudsql-cli
		    curl -LJO https://github.atcloud.io/raw/AutoTrader/cloudsql-cli/master/cloudsql-cli-auditing.sh
		        chmod +x /usr/local/bin/cloudsql-cli-auditing.sh
			    curl -LJO https://github.atcloud.io/raw/AutoTrader/cloudsql-cli/master/cloudsql-cli-backup.sh
			        chmod +x /usr/local/bin/cloudsql-cli-backup.sh
				    curl -LJO https://github.atcloud.io/raw/AutoTrader/cloudsql-cli/master/cloudsql-cli-database.sh
				        chmod +x /usr/local/bin/cloudsql-cli-database.sh
					    curl -LJO https://github.atcloud.io/raw/AutoTrader/cloudsql-cli/master/cloudsql-cli-global.sh
					        chmod +x /usr/local/bin/cloudsql-cli-global.sh
						    curl -LJO https://github.atcloud.io/raw/AutoTrader/cloudsql-cli/master/cloudsql-cli-instance.sh
						        chmod +x /usr/local/bin/cloudsql-cli-instance.sh
							    curl -LJO https://github.atcloud.io/raw/AutoTrader/cloudsql-cli/master/cloudsql-cli-ops.sh
							        chmod +x /usr/local/bin/cloudsql-cli-ops.sh
								    curl -LJO https://github.atcloud.io/raw/AutoTrader/cloudsql-cli/master/cloudsql-cli-proxy.sh
								        chmod +x /usr/local/bin/cloudsql-cli-proxy.sh
									    curl -LJO https://github.atcloud.io/raw/AutoTrader/cloudsql-cli/master/cloudsql-cli-query.sh
									        chmod +x /usr/local/bin/cloudsql-cli-query.sh
										    curl -LJO https://github.atcloud.io/raw/AutoTrader/cloudsql-cli/master/cloudsql-cli-register.sh
										        chmod +x /usr/local/bin/cloudsql-cli-register.sh
											    curl -LJO https://github.atcloud.io/raw/AutoTrader/cloudsql-cli/master/cloudsql-cli-schema.sh
											        chmod +x /usr/local/bin/cloudsql-cli-schema.sh
												    curl -LJO https://github.atcloud.io/raw/AutoTrader/cloudsql-cli/master/cloudsql-cli-search.sh
												        chmod +x /usr/local/bin/cloudsql-cli-search.sh
													    curl -LJO https://github.atcloud.io/raw/AutoTrader/cloudsql-cli/master/cloudsql-cli-user.sh
													        sleep 1

													}


												# install
												if [ -f "$file" ]
												then
													    upgrade
													        sleep 1
														    echo "$(tput bold)Upgrading CloudSQL CLI..."
														        cd /usr/local/bin
															    copyfiles
															        echo "$(tput setaf 2)Completed!"
															else
																    install
																        sleep 1
																	    echo "$(tput bold)Installing CloudSQL CLI..."
																	        cd /usr/local/bin
																		    copyfiles
																		        echo "$(tput setaf 2)Completed!"
												fi
