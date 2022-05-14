function main()
    n = parse(Int, readline())
    t, a = parse.(Int, split(readline()))
    hs = parse.(Int, split(readline()))

    place = 0
    score = typemax(Float64)
    for i in 1:n
        new_score = abs(a - (t - hs[i] * 0.006))
        if new_score < score
            score = new_score
            place = i
        end
    end
    println(place)
end

main()
