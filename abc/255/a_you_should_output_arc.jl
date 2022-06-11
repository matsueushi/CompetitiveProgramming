parseints() = parse.(Int, split(readline()))

function main()
    r, c = parseints()
    a = zeros(Int, 2, 2)
    for i in 1:2
        a[i, :] = parseints()
    end
    println(a[r, c])
end

main()
