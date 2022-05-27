parseint() = parse(Int, readline())
parseints() = parse.(Int, split(readline()))

function solve(h, w, n, as)
    ind = 1
    for i in 1:h
        r = w
        cs = Int[]
        while r > 0
            s = min(r, as[ind])
            r -= s
            as[ind] -= s
            for j in 1:s
                push!(cs, ind)
            end
            as[ind] == 0 && (ind += 1)
        end
        if iseven(i)
            reverse!(cs)
        end
        println(join(cs, " "))
    end
end

function main()
    h, w = parseints()
    n = parseint()
    as = parseints()
    solve(h, w, n, as)
end

main()
