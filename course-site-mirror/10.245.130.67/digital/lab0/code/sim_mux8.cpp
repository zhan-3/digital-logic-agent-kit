#include "Vmux8.h"  // Verilator生成的模型头文件这里对应mux8.sv的模块名
#include "verilated.h"
#include "verilated_vcd_c.h"  // 用于生成VCD波形文件
#include <iostream>
#include <fstream>
#include <sstream>  // 添加对 std::istringstream 的支持

double sc_time_stamp() {
    return main_time;  // 返回当前仿真时间
}

VerilatedContext* contextp = NULL;
VerilatedVcdC* tfp = NULL;

static Vmux8* top;  // 修改2 对应mux8.sv的模块名

//单步仿真并生成波形
void step_and_dump_wave(){
  top->eval();
  tfp->dump(contextp->time());
  contextp->timeInc(1);
}

//仿真初始化
void sim_init(){
  contextp = new VerilatedContext;
  tfp = new VerilatedVcdC;
  top = new Vmux8;    //修改3 对应mux8.sv的模块名
  contextp->traceEverOn(true);
  top->trace(tfp, 0);
  tfp->open("dump.vcd");
}

//仿真结束
void sim_exit(){
  step_and_dump_wave();
  delete top;
  tfp->close();
  delete contextp;
}

//仿真主函数，根据自己的设计修改仿真逻辑
int main(int argc, char** argv) {
    Verilated::commandArgs(argc, argv);
    
    sim_init();

    // 初始化信号
    top->D = 0;
    top->sel = 0;
    step_and_dump_wave();
    
    for(i=0;i<256;i++)
        for(j=0;j<8;j++)
        {
            top->D = i;
            top->sel = j;
            step_and_dump_wave();
            std::cout << "D: " << (int)top->D << ", sel: " << (int)top->sel << ", Y: " << (int)top->Y << std::endl;

            // 检查输出是否正确
            if (top->Y != ((i >> j) & 1)) {
                std::cerr << "Error: D = " << (int)top->D << ", sel = " << (int)top->sel << ", Y = " << (int)top->Y << std::endl;
            }
        }


    // 结束仿真
    sim_exit();
    return 0;
}