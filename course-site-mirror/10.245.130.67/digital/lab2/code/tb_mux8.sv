module tb_mux8();
    logic [7:0] D;
    logic [2:0] sel;
    logic       Y;

    // 指明仿真波形输出文件名和模块名
    initial begin
        $dumpfile("tb_mux8.vcd");
        $dumpvars(0, tb_mux8);
    end

    // 实例化被测模块
    mux8 dut (
        .D(D),
        .sel(sel),
        .Y(Y)
    );

    initial begin
        // 显示输出表头
        $display("D | sel | Y");

        // 测试用例1: D = 8'b0101_0101
        D = 8'b0101_0101;
        // 循环测试所有选择信号
        for (int i = 0; i < 8; i++) begin
            sel = i;
            #10;
            $display("%b | %b | %b", D, sel, Y);

            if (Y !== D[sel]) begin
                $display("ERROR: mismatch at sel=%3b -> expected Y=%b, got Y=%b",
                         sel, D[sel], Y);
                $fatal(1, "mux8 functional check failed");
            end
        end

         $display("test1 passed.");

        D = 8'b1010_1010;
        $display("D | sel | Y");

        for (int i = 0; i < 8; i++) begin
            sel = i;
            #10;
            $display("%b | %b | %b", D, sel, Y);

            if (Y !== D[sel]) begin
                $display("ERROR: mismatch at sel=%3b -> expected Y=%b, got Y=%b",
                         sel, D[sel], Y);
                $fatal(1, "mux8 functional check failed");
            end
        end

        $display("test2 passed.");

        $finish;
    end
endmodule