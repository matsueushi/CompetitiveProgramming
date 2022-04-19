function main()
    h, w = parse.(Int, split(readline()))
    a = zeros(Int, h, w)
    for i in 1:h
        a[i, :] = parse.(Int, split(readline()))
    end
    for j in 1:w
        println(join(a[:, j], ' '))
    end
end

main()
