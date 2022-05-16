function main()
    c = zeros(Int, 3, 3)
    for i in 1:3
        c[i, :] = parse.(Int, split(readline()))
    end
    cdiff = diff(diff(c; dims=1); dims=2)
    println(ifelse(iszero(cdiff), "Yes", "No"))
end

main()
