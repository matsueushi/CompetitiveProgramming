function main()
    h, w = parse.(Int64, split(readline()))
    println((h == 1 || w == 1) ? h * w : ((h + 1) ÷ 2) * ((w + 1) ÷ 2))
end

main()
