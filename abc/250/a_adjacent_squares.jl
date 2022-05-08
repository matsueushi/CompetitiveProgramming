function main()
    h, w = parse.(Int, split(readline()))
    r, c = parse.(Int, split(readline()))
    count = 0
    for (i, j) in [(-1, 0), (1, 0), (0, -1), (0, 1)]
        (1 ≤ r + i ≤ h && 1 ≤ c + j ≤ w) && (count += 1)
    end
    println(count)
end

main()
