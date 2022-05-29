function solve(s)
    ops = [+, -]
    c = parse.(Int, collect(s))
    for i in 1:2
        for j in 1:2
            for k in 1:2
                op1 = ops[i]
                op2 = ops[j]
                op3 = ops[k]
                op3(op2(op1(c[1], c[2]), c[3]), c[4]) == 7 && return "$(c[1])$op1$(c[2])$op2$(c[3])$op3$(c[4])=7"
            end
        end
    end
end

function main()
    s = readline()
    println(solve(s))
end

main()
