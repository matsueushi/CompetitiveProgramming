function solve(s)
    xs = Int[]
    num = 0
    current = 'R'
    n = length(s)
    for i in 1:n
        if s[i] != current
            current = s[i]
            push!(xs, num)
            num = 0
        end
        num += 1
        if i == n
            push!(xs, num)
        end
    end
    res = Int[]
    m = length(xs) ÷ 2
    for i in 1:m
        rnum = xs[2*i-1]
        lnum = xs[2*i]
        rstay = (rnum + 1) ÷ 2 + lnum ÷ 2
        lstay = rnum ÷ 2 + (lnum + 1) ÷ 2
        for _ in 1:rnum-1
            push!(res, 0)
        end
        push!(res, rstay)
        push!(res, lstay)
        for _ in 1:lnum-1
            push!(res, 0)
        end
    end
    res
end

function main()
    s = readline()
    println(join(solve(s), " "))
end

main()
