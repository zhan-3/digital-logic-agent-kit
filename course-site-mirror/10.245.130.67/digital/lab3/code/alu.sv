`timescale 1ns / 1ps
// 完成8位算术逻辑单元（ALU）的建模。 支持 加法、减法、按位逻辑运算、移位
module alu (
    input logic [7:0] a, b,// 第一个操作数
    input logic add_op, sub_op, and_op, or_op, shl_op, // 操作码对应：加法、减法、按位与、按位或、逻辑左移
    // 对应位 0 有效； 只有一个操作码为0，其他为1 ；
    // 对应按键 K1、K2、K3、K4、K5 ,按下为 0 ；
    // shl_op: 左移操作完成 操作数 a << b [2:0]，即左移 b 位;
    
    output logic [7:0] result, // 结果
    output logic carry_out, // 进位输出
    output logic zero // 零标志
);



endmodule