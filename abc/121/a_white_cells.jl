parseints() = parse.(Int, split(readline()))

function main()
    h, w = parseints()
    h0, w0 = parseints()
    println((h - h0) * (w - w0))
end

main()
