function solve(n, w, as)
    wts = falses(3 * 10^6)
    for i in 1:n
        wts[as[i]] = true
    end
    for i in 1:n
        for j in i+1:n
            wts[as[i]+as[j]] = true
        end
    end
    for i in 1:n
        for j in i+1:n
            for k in j+1:n
                wts[as[i]+as[j]+as[k]] = true
            end
        end
    end
    sum(wts[1:w])
end

function main()
    n, w = parse.(Int, split(readline()))
    as = parse.(Int, split(readline()))
    println(solve(n, w, as))
end

main()
