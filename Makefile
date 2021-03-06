
OPENERP_ADDONS=../ocb-addons,../ocb-web/addons,../banking-addons-reconcile,../file-exchange,.
COVERAGE?=coverage
COVERAGE_REPORT=$(COVERAGE) report -m
COVERAGE_PARSE_RATE=$(COVERAGE_REPORT) | tail -n 1 | sed "s/ \+/ /g" | cut -d" " -f4
OE=whereis oe | cut -d" " -f2

MODULE_NAME=account_statement_be2bill
MODULE_PATH=$(MODULE_NAME)
DB_NAME=test_$(MODULE_NAME)
DROP_DB=echo 'DROP DATABASE $(DB_NAME);' | psql


test-oe:
	#createdb $(DB_NAME)
	#openerp-server --addons=$(OPENERP_ADDONS) -i $(MODULE_NAME) --stop-after-init -d $(DB_NAME)
	#$(COVERAGE) run -p --omit=$(MODULE_PATH)/__openerp__.py --source=$(MODULE_PATH)
	oe run-tests -d $(DB_NAME) --addons $(OPENERP_ADDONS) -m $(MODULE_NAME) #|| $(DROP_DB) && exit 1
	#$(DROP_DB)
	#$(COVERAGE) combine
	#$(COVERAGE_REPORT)
	#if [ "100%" != "`$(COVERAGE_PARSE_RATE)`" ] ; then exit 1 ; fi

