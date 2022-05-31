parseint() = parse(Int, readline())

function solve(n, ss)
    cs = zeros(Int, 5)
    for i in 1:n
        s = ss[i]
        c = first(s)
        if c == 'M'
            cs[1] += 1
        elseif c == 'A'
            cs[2] += 1
        elseif c == 'R'
            cs[3] += 1
        elseif c == 'C'
            cs[4] += 1
        elseif c == 'H'
            cs[5] += 1
        end
    end

    res = 0
    for i in 1:1<<5
        y = 0
        yres = 1
        for j in 1:5
            if i >> (j - 1) & 1 == 1
                y += 1
                yres *= cs[j]
            end
        end
        if y == 3
            res += yres
        end
    end
    res
end

function main()
    n = parseint()
    ss = Vector{String}(undef, n)
    for i in 1:n
        ss[i] = readline()
    end
    println(solve(n, ss))
end

main()
