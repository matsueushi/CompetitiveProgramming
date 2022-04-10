function main()
    q = parse(Int64, readline())
    xs = Int64[]
    cxs = Int64[]
    cns = Int64[]
    a = 0
    b = 0
    used = 0
    csum = 0
    for i in 1:q
        query = parse.(Int64, split(readline()))
        qt = query[1]
        if qt == 1
            x, c = query[2], query[3]
            push!(xs, x)
            a += x * c
            b += c
            push!(cxs, a)
            push!(cns, b)
        else
            c = query[2]
            used += c
            ind = searchsortedfirst(cns, used)
            if ind == 1
                newsum = csum + c * xs[1]
            else
                newsum = cxs[ind-1] + (used - cns[ind-1]) * xs[ind]
            end
            println(newsum - csum)
            csum = newsum
        end
    end
end

main()
