module tb_alu();
    logic [7:0] a, b;
    logic add_op, sub_op, and_op, or_op, shl_op;
    logic [7:0] result;
    logic carry_out, zero;

    // 实例化ALU模块
    alu uut (
        .a(a),
        .b(b),
        .add_op(add_op),
        .sub_op(sub_op),
        .and_op(and_op),
        .or_op(or_op),
        .shl_op(shl_op),
        .result(result),
        .carry_out(carry_out),
        .zero(zero)
    );

    initial begin
        $dumpfile("tb_alu.vcd");
        $dumpvars(0, tb_alu);
    end

    initial begin

        add_op =1'b1;
        sub_op =1'b1;
        and_op =1'b1;
        or_op =1'b1;
        shl_op =1'b1;

        for(int i = 0; i < 100; i++) begin
            // 随机生成输入信号
            a = $random;
            b = $random;
            add_op = 1'b0;
            $display("a=%b,  b=%b,  a + b =%b, carry_out=%b, zero=%b", a, b, result, carry_out, zero);

            #10; // 等待10个时间单位
            add_op = 1'b1;
            sub_op = 1'b0;
            $display("a=%b,  b=%b,  a - b =%b, carry_out=%b, zero=%b", a, b, result, carry_out, zero);

            #10; // 等待10个时间单位
            sub_op = 1'b1;
            and_op = 1'b0;
            $display("a=%b,  b=%b,  a & b =%b", a, b, result);
            #10; // 等待10个时间单位
            and_op = 1'b1;
            or_op = 1'b0;
            $display("a=%b,  b=%b,  a | b =%b", a, b, result);
            #10; // 等待10个时间单位
            or_op = 1'b1;
            shl_op = 1'b0;
            $display("a=%b,  b=%b,  a << b =%b", a, b, result);
            #10; // 等待10个时间单位
            shl_op = 1'b1;
        end

        $finish;

    end

endmodule