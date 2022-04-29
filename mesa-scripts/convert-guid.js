const fs = require("fs");
function convert_guid(guid_str) {
  let uuid = guid_str.toLowerCase();

  let y = uuid.split("-");
  let t = y[3] + y[4];
  let prefix = `0x${y[0]}, 0x${y[1]}, 0x${y[2]}`;
  for (let i = 0; i < 8; i += 1) {
    prefix += `, 0x${t.slice(i * 2, i * 2 + 2)}`;
  }
  return prefix;
}
function convert_line(line) {
  if (!line.startsWith("CROSS_PLATFORM_UUIDOF")) {
    return line;
  }
  let name_uuid = line.split(",");
  let interface_name = name_uuid[0].split("(")[1];
  let guid = convert_guid(name_uuid[1].split('"')[1]);
  let result = `WINADAPTER_IID(${interface_name}, ${guid});`;
  return result;
}

const lines = fs
  .readFileSync("../mesa/src/microsoft/compiler/dxcapi.h", {
    encoding: "utf-8",
  })
  .split("\r\n");

for (let line of lines) {
  console.log(convert_line(line));
}
