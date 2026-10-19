# 顶层模块路径（相对根目录）
TOP_MODULE = mux8.sv
# SV模块搜索目录
SV_SEARCH_DIRS = 
# 生成搜索目录参数
SV_INC_FLAGS = $(addprefix -I,$(SV_SEARCH_DIRS))
# Verilator工具路径配置
ifeq ($(VERILATOR_ROOT),)
VERILATOR = verilator
else
export VERILATOR_ROOT
VERILATOR = $(VERILATOR_ROOT)/bin/verilator
endif

default:
	$(VERILATOR) -cc \
		--trace \
		--exe \
		--build \
		--quiet \
		-j \
		$(SV_INC_FLAGS) \
		$(TOP_MODULE) \
		main.cpp
	@echo "-- RUN ---------------------"
	obj_dir/Vmux8
	@echo "-- DONE --------------------"


clean mostlyclean distclean maintainer-clean::
	-rm -rf obj_dir *.log *.dmp *.vpd core
	-rm -f dump.vcd