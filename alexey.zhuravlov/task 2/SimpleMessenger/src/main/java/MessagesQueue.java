import lombok.extern.java.Log;

import java.io.*;
import java.util.*;

@Log
public class MessagesQueue {

    Deque<Message> messages = new ArrayDeque<>();
    File dir = new File(new File("messages").getAbsolutePath());

    String sender;
    String receiver;
    String name = "";
    String text = "";
    Date date = new Date();
    String attachmentName;
    Map<String, byte[]> attachments = new HashMap<>();
    byte[] attachment;

    public Deque loadMessages() {
        if (dir.isDirectory()) {
            File[] files = dir.listFiles();
            if (files != null) {
                for (File senderDir : files) {
                    if (senderDir.isDirectory()) {
                        sender = senderDir.getName();
                        File[] receiverDirFiles = senderDir.listFiles();
                        if (receiverDirFiles != null) {
                            for (File receiverDir : receiverDirFiles) {
                                if (receiverDir.isDirectory()) {
                                    receiver = receiverDir.getName();
                                    attachments = new HashMap<>();
                                    File[] receiverMessFiles = receiverDir.listFiles();
                                    if (receiverMessFiles != null) {
                                        for (File receiverMess : receiverMessFiles) {
                                            if (receiverMess.isFile()) {
                                                if (extension(receiverMess).equals("txt")) {
                                                    name = receiverMess.getName();
                                                    text = readMessageText(receiverMess);
                                                    date = new Date(receiverMess.lastModified());
                                                } else {
                                                    attachmentName = receiverMess.getName();
                                                    attachment = readMessageAttachment(receiverMess);
                                                    attachments.put(attachmentName, attachment);
                                                }
                                            }
                                        }
                                    }
                                    messages.offer(new Message(date, sender, receiver, name, text, attachments));
                                }
                            }
                        }


                    }
                }
            }
        }


        return messages;
    }


    public String extension(File file) {
        String extension = "";

        int i = file.getName().lastIndexOf('.');
        if (i > 0) {
            extension = file.getName().substring(i + 1);
        }
        return extension;
    }

    public String readMessageText(File file) {
        String s = "";
        try (BufferedReader br = new BufferedReader(new FileReader(file))) {
            s = br.readLine();
        } catch (IOException ex) {

            System.out.println(ex.getMessage());
        }
        return s;
    }

    public byte[] readMessageAttachment(File file) {
        try (FileInputStream fileInputStream = new FileInputStream(file)) {
            byte[] buffer = new byte[fileInputStream.available()];

            fileInputStream.read(buffer, 0, fileInputStream.available());
            return buffer;
        } catch (IOException ex) {

            System.out.println(ex.getMessage());
            return null;
        }
    }
}
