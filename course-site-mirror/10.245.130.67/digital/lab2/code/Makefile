# ============================================================================
#  Icarus Verilog + GTKWave/Surfer 仿真 Makefile 模板
# ----------------------------------------------------------------------------
#  用法：把本文件复制到工程根目录（文件名就是 Makefile），只改「用户配置区」，
#        然后在工程根目录执行：
#            make            # 默认：编译 + 仿真 + 打开波形
#            make sim        # 只编译 + 仿真（不开波形窗口）
#            make wave       # 打开波形查看器看波形（默认 GTKWave）
#            make all        # 编译 + 仿真 + 打开波形
#            make build      # 只编译（生成 .vvp）
#            make run        # 只仿真（不重新编译）
#            make rebuild    # 清干净后重新编译并仿真
#            make clean      # 删除生成物
#            make help       # 显示帮助
# ============================================================================


# ------------------------------- 用户配置区 --------------------------------

DUT ?= mux8

# 1) 顶层模块名 —— testbench 里面的 module 名字，作为 iverilog 的 -s 参数
TOP ?= tb_$(DUT)

# 2) 参与编译的源文件（顺序无关，顶层由 TOP 用 -s 指定）
#    默认自动收集当前目录下所有 .sv 文件；也可在命令行覆盖：
SRCS ?= $(wildcard *.sv)
# SRCS ?= $(DUT).sv tb_$(DUT).sv

# 3) 生成物文件名
OUT ?= $(TOP).out
VCD ?= $(TOP).vcd


# ------------------------------- 工具与参数 --------------------------------
# 工具不在 PATH 里时可以直接写全路径，例如：
#   IVERILOG = C:/iverilog/bin/iverilog.exe
IVERILOG     ?= iverilog
VVP          ?= vvp
GTKWAVE      ?= gtkwave
SURFER       ?= surfer

# 看波形默认用 GTKWave；想改用 Surfer 就执行 make wave WAVE=surfer
WAVE         ?= $(GTKWAVE)
WAVEARGS     ?=

# -g2012 支持 SystemVerilog；-Wall 打开全部警告
IVFLAGS      ?= -g2012 -Wall
VVPFLAGS     ?=



# ============================ 以下一般无需修改 ==============================

# 删除命令，用法：$(call CLEAN,文件列表)
# 注意：Windows 下 Remove-Item 删「不存在」的文件会往 stderr 打印错误并以退出码 1
#       结束，make 就会报 "Error 1 (ignored)"。这里用 -ErrorAction SilentlyContinue
#       静默错误，末尾 exit 0 保证退出码为 0（文件不存在时也能正常清理）。
# 把空格分隔的文件列表转成 PowerShell 的数组写法 a,b,c（-Path 不接受空格分隔）
empty :=
space := $(empty) $(empty)
comma := ,

ifeq ($(OS),Windows_NT)
  CLEAN = powershell -NoProfile -Command "Remove-Item -Force -ErrorAction SilentlyContinue -Path $(subst $(space),$(comma),$(1)); exit 0"
else
  CLEAN = rm -f $(1)
endif

.PHONY: all build run sim wave rebuild clean help

# 默认目标：编译 -> 仿真 -> 打开波形
# 仿真出错（vvp 非 0 返回）时不会弹出波形窗口，此时可单独执行 make wave 看波形
all: run wave

# --------------------------------- 编译 ------------------------------------
build: $(OUT)

$(OUT): $(SRCS) $(INPUTS) $(MAKEFILE_LIST)
	$(IVERILOG) $(IVFLAGS) $(DEFS) $(INC) -s $(TOP) -o $(OUT) $(SRCS)
	@echo "[build] $(OUT) generated"

# --------------------------------- 仿真 ------------------------------------
# 注意：仿真必须在工程根目录执行，否则 $dumpfile 的相对路径会落到别处
run: $(OUT)
	$(VVP) $(VVPFLAGS) $(OUT)
	@echo "[run] simulation done, waveform: $(VCD)"

sim: run

# -------------------------------- 看波形 -----------------------------------
# 说明：GUI 程序，窗口关闭前该目标和终端会被占用
# 默认 GTKWave；要改用 Surfer 用：make wave WAVE=surfer
wave:
	$(WAVE) $(WAVEARGS) $(VCD)

# ------------------------------ 清理与帮助 ---------------------------------
rebuild: clean sim

clean:
	-@$(call CLEAN,$(OUT) $(VCD))
	@echo "[clean] removed $(OUT) $(VCD)"

help:
	@echo Targets:
	@echo   make / make all   - compile (iverilog) + simulate (vvp) + open waveform viewer
	@echo   make sim          - compile + simulate only (no waveform viewer)
	@echo   make build        - compile only, output: $(OUT)
	@echo   make run          - simulate only
	@echo   make wave         - open waveform $(VCD) with $(WAVE)
	@echo   make rebuild      - clean, then compile + simulate
	@echo   make clean        - delete $(OUT) and $(VCD)
	@echo Configuration:
	@echo   TOP=$(TOP)
	@echo   SRCS=$(SRCS)
	@echo   INPUTS=$(INPUTS)
	@echo   WAVE=$(WAVE)   (make wave WAVE=surfer 可改用 Surfer)
	@echo   OUT=$(OUT)  VCD=$(VCD)
