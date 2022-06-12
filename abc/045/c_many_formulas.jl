function solve(s)
    res = 0
    ss = parse.(Int, Vector{Char}(s))
    ns = length(s)
    for i in 0:1<<(ns-1)-1
        c = ss[1]
        ds = Int[]
        for j in 1:ns-1
            if i >> (j - 1) & 1 == 1
                push!(ds, c)
                c = ss[j+1]
            else
                c *= 10
                c += ss[j+1]
            end
        end
        push!(ds, c)
        res += sum(ds)
    end
    res
end

function main()
    s = readline()
    println(solve(s))
end

main()
