parseint() = parse(Int, readline())
parseints() = parse.(Int, split(readline()))

function solve(h, w, cs, as)
    for k in 1:10
        for i in 1:10
            for j in 1:10
                cs[i, j] = min(cs[i, j], cs[i, k] + cs[k, j])
            end
        end
    end
    res = 0
    for i in 1:h
        for j in 1:w
            as[i, j] == -1 && continue
            res += cs[as[i, j]+1, 1+1]
        end
    end
    res
end

function main()
    h, w = parseints()
    cs = zeros(Int, 10, 10)
    for i in 1:10
        cs[i, :] = parseints()
    end
    as = zeros(Int, h, w)
    for i in 1:h
        as[i, :] = parseints()
    end
    println(solve(h, w, cs, as))
end

main()
